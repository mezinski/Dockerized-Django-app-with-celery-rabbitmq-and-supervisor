from __future__ import absolute_import
import os
from celery import Celery
# from celery.schedules import crontab
# from mysite2.core.tasks import create_random_user_accounts

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite2.settings')

app = Celery('mysite2',broker='amqp://admin:mypass@rabbit')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()

# @app.on_after_configure.connect
# def setup_periodic_tasks(sender, **kwargs):

#     sender.add_periodic_task(60.0, create_random_user_accounts.delay(50))

#     sender.add_periodic_task(
#         crontab(hour=10, minute=0, day_of_week=2),
#         create_random_user_accounts.delay(50),
#     )