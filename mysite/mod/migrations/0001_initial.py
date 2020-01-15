# Generated by Django 2.1.5 on 2020-01-12 11:16

from django.db import migrations, models
import mod.validator


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='branddata',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(default='hay', max_length=240)),
                ('itemid', models.IntegerField(default=0)),
                ('price', models.IntegerField(default=0)),
                ('rating', models.IntegerField(default=0)),
                ('brand', models.CharField(default='zain', max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='cdata',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='hay', max_length=240)),
                ('uname', models.CharField(default='hay', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(default='hay', max_length=240)),
                ('user_name', models.CharField(default='zain', max_length=30)),
                ('email', models.CharField(default='zain@gmail.com', max_length=40)),
                ('slug', models.SlugField(blank=True, null=True)),
                ('phone', models.IntegerField(null=True)),
                ('context', models.TextField(blank=True, null=True)),
                ('publish', models.CharField(choices=[('draft', 'Draft'), ('public', 'Public'), ('private', 'Private'), ('publish', 'Publish')], default='draft', max_length=120)),
                ('view_count', models.IntegerField(default=0)),
                ('publish_date', models.DateField()),
                ('auther_email', models.CharField(blank=True, max_length=240, null=True, validators=[mod.validator.valid_email])),
                ('updated', models.DateTimeField(auto_now=True)),
                ('timestemp', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name': 'Post',
                'verbose_name_plural': 'Posts',
            },
        ),
    ]