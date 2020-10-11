.. SEMESTER_THESIS documentation master file, created by
   sphinx-quickstart on Wed Oct  7 16:24:21 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to the Documentation of my Thesis!
===========================================


Datasets
========

Discription of the Datasets
---------------------------
I will add a short description of the datasets structure here.

The :mod:`extracting_data` module provides the functionality of extracting parts of the dataset.

Extracting Data from Dataset
----------------------------
Functions called in this context
++++++++++++++++++++++++++++++++
.. module:: extracting_data
.. autofunction:: get_posture_indices()

Dataset Visualization
======================

The :mod:`data_visualization` module provides the functionality of visualizing (parts of) the dataset to generate more insights.

Visualizing a Selection of Postures
-----------------------------------

.. module:: data_visualization
.. autoscript:: plotting_framework_advanced

The script :scpt:`plotting_framework_advanced` calls the following function(s):

* :func:`plot_as_histogram` to generate a histogram

Functions called in this context
++++++++++++++++++++++++++++++++

.. module:: data_visualization
.. autofunction:: plot_as_histogram()


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
