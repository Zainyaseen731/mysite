from django.contrib import admin
from .models import Post, cdata, branddata


# admin.site.register(Post)
# Register your models here.
class PostAdmin(admin.ModelAdmin):
    fields = [
        'title',
        'user_name',
        'slug',
        'email',
        'phone',
        'publish',
        'publish_date',
        'updated', 'timestemp', 'age'

    ]
    readonly_fields = ['updated', 'timestemp', 'age']

    def age(self, obj, *args, **kwargs):
        return str(obj.age())

    class Meta:
        model = Post


class BrandAdmin(admin.ModelAdmin):
    fields = [
        'title',
        'itemid',
        'price',
        'rating',
        'brand',

    ]


class CAdmin(admin.ModelAdmin):
    fields = [
        'uname',
        'title',

    ]


admin.site.register(Post, PostAdmin)
admin.site.register(cdata, CAdmin)
admin.site.register(branddata, BrandAdmin)
