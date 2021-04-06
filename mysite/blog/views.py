from .models import *
from .forms import *
from django.views.generic import DetailView, ListView
from django.shortcuts import get_object_or_404, reverse, render, redirect
from django.views.generic.edit import FormMixin
from django.http import HttpResponseRedirect, HttpResponseNotFound
from django.contrib.auth.decorators import login_required

class HomeView(ListView):
    model = Post
    template_name = 'post_list.html'
    context_object_name = 'all_posts_list'
    paginate_by = 1

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = Category.objects.all()
        context['article'] = Post.objects.all().values()
        return context

class PostDetailView(FormMixin, DetailView):
    model = Post
    template_name = 'post_detail.html'
    form_class = CommentForm

    def get_success_url(self):
        return reverse('post_detail', kwargs={'pk': self.object.pk})

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        post = get_object_or_404(Post, id=self.kwargs['pk'])
        context['single_article'] = Post.objects.filter(id=post.pk)
        context['comments'] = Comment.objects.filter(post=self.object)
        context['comments_sum'] = Comment.objects.filter(post=self.object).count()
        context['comment_form'] = CommentForm()
        context['category_details'] = Category.objects.all()
        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()
        comment_form = self.get_form()
        if comment_form.is_valid():
            return self.form_valid(comment_form)
        else:
            return self.form_invalid(comment_form)


    def form_valid(self, comment_form):
        comment_form.instance.post = self.object
        comment_form.instance.author = self.request.user
        comment_form.save()
        return super().form_valid(comment_form)


class CategoryView(ListView):
    model = Post
    template_name = 'post_category_view.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['art_category'] = Post.objects.filter(category=self.kwargs['pk'])
        context['category_details_view'] = Category.objects.all()
        return context


def search_bar(request):
    category_search = Category.objects.all()
    if request.method == "GET":
        searched = request.GET.get('q')
        result = Post.objects.filter(title__icontains=searched).values()
    return render(request, 'blog/search.html', {'result': result, 'searched': searched, 'category_search': category_search})


@login_required
def add_post(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            form = PostForm(request.POST)
            form.save()
            return redirect('post_list')
        else:
            form = PostForm()
    return render(request, 'blog/post_form.html', {"form": form})


@login_required
def edit_post(request, pk):
    author = get_object_or_404(Author, user=request.user)
    post = get_object_or_404(Post, pk=pk, author=author)

    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('post_detail', args=[pk]))
    else:
        form = PostForm(instance=post)
        return render(request, 'blog/post_update.html', {'form': form, 'post': post})


@login_required
def delete_post(request, pk):
    author = get_object_or_404(Author, user=request.user)
    post = get_object_or_404(Post, pk=pk, author=author)
    if request.method == "POST":
        form = PostDeleteForm(request.POST, instance=post)
        if form.is_valid():
            post.delete()
            return redirect('post_list')
        return render(request, 'blog/post_delete.html', {'form': form, 'post': post})

