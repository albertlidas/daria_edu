from .models import Post, Category, Comment
from .forms import CommentForm
from django.views.generic import DetailView, ListView, CreateView, UpdateView, DeleteView
from django.shortcuts import get_object_or_404, reverse, render
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic.edit import FormMixin, SingleObjectMixin

class HomeView(ListView):
    model = Post
    template_name = 'base.html'
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
        context['comment_form'] = CommentForm()
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

class CategoryView(ListView):
    model = Post
    template_name = 'post_category_view.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['art_category'] = Post.objects.filter(category=self.kwargs['pk'])
        return context


