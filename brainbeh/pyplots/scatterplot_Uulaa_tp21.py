#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 22 14:29:50 2023

@author: noeliamartinezmolina
"""

import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd


# Set plot style and frame
sns.set_theme(style="darkgrid")
plt.rcParams['font.family'] = 'Helvetica'


# Import data from file
df=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/CI_singavsrest_F_mean_cluster.csv',
               usecols=[0, 1])
df.head()

# Create scatterplot with linear regression
##### COMMUNICATION INDEX
plt.figure(figsize = (4,4))
ax=sns.regplot(data=df, x="x", y="y", scatter='True', color="darkgreen", ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-10, 0, 10, 20, 30])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10, -5, 0, 5, 10])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
    
ax.set(
        title=None,
        ylabel='Communication Index',
        xlabel='Contrast estimates cluster mean',
        )


plt.savefig('brainbeh_singavsrest_F_cluster_CI.jpg', bbox_inches='tight', dpi=300)
plt.show()

####RESPONSIVE SPEECH INDEX

df2=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/RSI_singavsrest_F_mean_cluster.csv',
               usecols=[0, 1])
df2.head()

plt.figure(figsize = (4,4))
ax=sns.regplot(data=df2, x="x", y="y", scatter='True', color="darkgreen", ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-5, 0, 5, 10, 15])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10, -5, 0, 5, 10])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.set(
        title=None,
        ylabel='Responsive Speech Index',
        xlabel='Contrast estimates cluster mean',
        )


plt.savefig('brainbeh_singavsrest_F_cluster_RSI.jpg', bbox_inches='tight', dpi=300)
plt.show()

##### VERBAL LEARNING

df3=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/UU_corr_syll_singavsrest_F_mean_cluster.csv',
               usecols=[0, 1])
df3.head()

plt.figure(figsize = (4,4))
ax=sns.regplot(data=df3, x="x", y="y", scatter='True', color="darkred", ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-10,0, 10, 20, 30, 40])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10, -5, 0, 5, 10])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.set(
        title=None,
        ylabel='Uulaa Correct Syllables Change',
        xlabel='Contrast Estimates Cluster Mean',
        )


plt.savefig('brainbeh_singavsrest_F_cluster_UU_C_Syll.jpg', bbox_inches='tight', dpi=300)
plt.show()


df4=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/UU_corr_alm_syll_singavsrest_F_mean_cluster.csv',
               usecols=[0, 1])
df4.head()


plt.figure(figsize = (4,4))
ax=sns.regplot(data=df4, x="x", y="y", scatter='True', color="darkred",ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-10,0, 10, 20, 30, 40])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10, -5, 0, 5, 10])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.set(
        title=None,
        ylabel='Uulaa Correct and almost correct syllables',
        xlabel='Contrast estimates cluster mean',
        )


plt.savefig('brainbeh_singavsrest_F_cluster_UU_C_alm_C_syll.jpg', bbox_inches='tight', dpi=300)
plt.show()


df5=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/UU_corr_syll_err_singavsrest_F_mean_cluster.csv',
               usecols=[0, 1])
df5.head()

plt.figure(figsize = (4,4))
ax=sns.regplot(data=df5, x="x", y="y", scatter='True', color="darkred", ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-10,0, 10, 20, 30, 40])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10, -5, 0, 5, 10])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.set(
        title=None,
        ylabel='Uulaa Correct minus errors syllables',
        xlabel='Contrast estimates cluster mean',
        )


plt.savefig('brainbeh_singavsrest_F_cluster_UU_C_minus_C_Syll.jpg', bbox_inches='tight', dpi=300)
plt.show()

df6=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/UU_corr_words_singavsrest_F_mean_cluster.csv',
               usecols=[0, 1])
df6.head()

plt.figure(figsize = (4,4))
ax=sns.regplot(data=df6, x="x", y="y", scatter='True', color="darkred", ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-5, 0, 5, 10, 15, 20, 25])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10, -5, 0, 5, 10])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.set(
        title=None,
        ylabel='Uulaa Correct Words Change',
        xlabel='Contrast Estimates Cluster Mean',
        )


plt.savefig('brainbeh_singavsrest_F_cluster_UU_C_words.jpg', bbox_inches='tight', dpi=300)
plt.show()

