from .models import Post, Category, Comment
from .forms import CommentForm
from django.views.generic import DetailView, ListView
from django.shortcuts import render, get_object_or_404

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

    def comment_form(self, request):
        if request.method == 'POST':
            comment_form = CommentForm(request.POST)
            if comment_form.is_valid():
                new_comment = comment_form.save()
                new_comment.save()
            else:
                comment_form = CommentForm()
        return comment_form

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['art_category'] = Post.objects.filter(category=self.kwargs['pk'])
        context['commentator'] = Comment.objects.filter(commentator=True).values()
        context['comment_form'] = self.comment_form
        return context
