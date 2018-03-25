# -*- coding: utf-8 -*-
"""Test case for home.views."""
from django.test import Client
from django.urls import reverse


def test_index():
    """Get the index and test some things."""
    client = Client()
    response = client.get(reverse('index'))

    if response.status_code != 200:
        raise AssertionError()
