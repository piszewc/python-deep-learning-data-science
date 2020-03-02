from django.shortcuts import render

def main_page(request):
    return render(request, 'SortingPage/main_page.html', {})
