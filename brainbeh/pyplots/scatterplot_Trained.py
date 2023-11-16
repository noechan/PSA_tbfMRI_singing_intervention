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
df=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/CI_singavsrest_T_mean_cluster.csv',
               usecols=[0, 1])
df.head()

# Create scatterplot with linear regression
##### CLINICAL OUTCOMES
plt.figure(figsize = (4,4))
ax=sns.regplot(data=df, x="x", y="y", scatter='True', color="darkgreen", ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-10, 0, 10, 20, 30, 40])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10, -5, 0,5,10,15,20])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.set(
        title=None,
        ylabel='Communication Index',
        xlabel='Contrast estimates cluster mean',
        )


#plt.savefig('brainbeh_singavsrest_T_cluster_CI.jpg', bbox_inches='tight', dpi=300)
plt.show()

df_rsi=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/brainbeh/pyplots/RSI_singavsrest_T_mean_cluster.csv',
               usecols=[0, 1])
df_rsi.head()
plt.figure(figsize = (4,4))
ax=sns.regplot(data=df_rsi, x="x", y="y", scatter='True', color="darkgreen", ci=95,line_kws={"color":"grey","alpha":0.7,"lw":2})
ax.set_yticks([-5,0,5,10,15])
ax.set_yticklabels(ax.get_yticks(), size = 16)
ax.set_xticks([-10,-5,0,5,10,15,20])
ax.set_xticklabels(ax.get_xticks(), size = 16)

for axis in ['top','bottom', 'left','right']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.set(
        title=None,
        ylabel='Responsive Speech Index',
        xlabel='Contrast estimates cluster mean',
        )


plt.savefig('brainbeh_singavsrest_T_cluster_RSI.jpg', bbox_inches='tight', dpi=300)
plt.show()