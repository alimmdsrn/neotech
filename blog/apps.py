from django.apps import AppConfig


class BlogConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'blog'
    verbose_name = "وبلاگ"

    def ready(self):
        # Fix for django-jalali on MariaDB/MySQL:
        # jDateTimeField uses the *date* adapter when saving, which keeps the
        # "+00:00" timezone suffix. MariaDB rejects that value, so we switch it
        # to Django's proper *datetime* adapter (which stores naive UTC).
        import jdatetime
        from django_jalali.db.models import jDateTimeField

        def get_db_prep_value(self, value, connection, prepared=False):
            if not prepared:
                value = self.get_prep_value(value)
            if isinstance(value, jdatetime.datetime):
                value = value.togregorian()
            return connection.ops.adapt_datetimefield_value(value)

        jDateTimeField.get_db_prep_value = get_db_prep_value