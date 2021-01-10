from .models import Post, Category, Comment
from .forms import CommentForm
from django.views.generic import DetailView, ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin

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

class PostDetailView(DetailView):
    model = Post
    template_name = 'post_detail.html'
    context_object_name = 'post_by_category'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        post = get_object_or_404(Post, id=self.kwargs['pk'])
        context['comments'] = Comment.objects.filter(post=post).order_by('-id')
        context['art_category'] = Post.objects.filter(category=self.kwargs['pk'])
        return context

class PostCreateView(LoginRequiredMixin, CreateView):
    model = Post
    fields = ['category', 'author', 'title', 'article']

    def form_valid(self, form):
        form.instance.Author = self.request.user
        return super().form_valid(form)

class UpdatePostView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Post
    fields = ['category', 'author', 'title', 'article']

    def form_valid(self, form):
        form.instance.Author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False

class DeletePostView (LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post
    success_url = '/'

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False

def add_comment (request, pk):
    post_id = request.POST.get('post_id')
    post = get_object_or_404(Post, pk=post_id)
    comments = Comment.objects.filter(is_active=True)
    new_comment = None
    if request.method == 'POST':
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            new_comment = comment_form.save(commit=False)
            new_comment.post = post
            new_comment.save()
    else:
        comment_form = CommentForm()
    return render(request, 'add_comment.html', {'post': post, 'comments': comments, 'new_comment': new_comment, 'comment_form': comment_form})


