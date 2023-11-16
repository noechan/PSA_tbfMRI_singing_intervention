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
sns.set_theme(style="white")
plt.rcParams['xtick.bottom'] = False
plt.rcParams['xtick.labelbottom'] = True
plt.rcParams['xtick.major.pad'] = 15
plt.rcParams['ytick.left'] = True
plt.rcParams['font.family'] = 'Helvetica'



# Import data from singing performance
df=pd.read_csv('/Volumes/LASA/Aphasia_project/manuscripts/fMRI_SciRep/code/verbal learning/pyplots/LASA_UULA_verbal_learning.csv',
               usecols=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
df.head()

# Create barplot and add individual data point
# Correct syllables
plt.figure(figsize = (4,4))
ax=sns.barplot(data=df, x="Group", y="UU_C_syll", hue="Timepoint",  palette=('muted'),saturation=0.7, alpha=0.8, edgecolor='black', capsize = 0.2, lw = 2, errwidth = 1, errcolor = '0.2')
ax.set_yticks([0, 20, 40, 60, 80])
ax.set_yticklabels(ax.get_yticks(), size = 16)

for axis in ['bottom', 'left']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)


ax.set(
        title=None,
        ylabel='Uulaa Correct Syllables',
        xlabel=None,
        )

leg = plt.legend() 
ax.get_legend().remove()
#plt.legend(frameon = False, prop = {'weight':'bold', 'size':14}, labelcolor = '0.2', loc="upper right")
plt.savefig('LASA_UULAA_C_syll.jpg', bbox_inches='tight', dpi=300)
plt.show()

# Correct and almost correct syllables
plt.figure(figsize = (4,4))
ax=sns.barplot(data=df, x="Group", y="UU_C_and_alm_C_syll", hue="Timepoint", palette=('muted'),saturation=0.7, alpha=0.8, edgecolor='black', capsize = 0.2, lw = 2, errwidth = 1, errcolor = '0.2')
ax.set_yticks([0, 20, 40, 60, 80])
ax.set_yticklabels(ax.get_yticks(), size = 16)

for axis in ['bottom', 'left']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)


ax.set(
        title=None,
        ylabel='Uulaa Correct and Almost Correct Syllables',
        xlabel=None,
        )


leg = plt.legend() 
ax.get_legend().remove()
plt.savefig('LASA_UULA_C_almost_C_syll.jpg', bbox_inches='tight', dpi=300)
plt.show()

# Correct minus errors syllables
plt.figure(figsize = (4,4))
ax=sns.barplot(data=df, x="Group", y="UU_C_minus_errors_syll", hue="Timepoint", palette=('muted'),saturation=0.7, alpha=0.8, edgecolor='black', capsize = 0.2, lw = 2, errwidth = 1, errcolor = '0.2')
ax.set_yticks([0, 20, 40, 60, 80])
ax.set_yticklabels(ax.get_yticks(), size = 16)

for axis in ['bottom', 'left']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)


ax.set(
        title=None,
        ylabel='Uulaa Correct Minus Errors Syllables',
        xlabel=None,
        )


leg = plt.legend() 
ax.get_legend().remove()
plt.savefig('LASA_UULAA_C_minus_errors_syll.jpg', bbox_inches='tight', dpi=300)
plt.show()

# Correct Words
plt.figure(figsize = (4,4))
ax=sns.barplot(data=df, x="Group", y="UU_C_words", hue="Timepoint", palette=('muted'),saturation=0.7, alpha=0.8, edgecolor='black', capsize = 0.2, lw = 2, errwidth = 1, errcolor = '0.2')
ax.set_yticks([0, 10, 20, 30])
ax.set_yticklabels(ax.get_yticks(), size = 16)

for axis in ['bottom', 'left']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)


ax.set(
        title=None,
        ylabel='Uulaa Correct Words',
        xlabel=None,
        )


leg = plt.legend() 
ax.get_legend().remove()
plt.savefig('LASA_UULA_C_words.jpg', bbox_inches='tight', dpi=300)
plt.show()

# UU-TY Correct syllables percent
plt.figure(figsize = (4,4))
ax=sns.barplot(data=df, x="Group", y="UU_minus_TY_syll_sum_perc", hue="Timepoint", palette=('muted'),saturation=0.7, alpha=0.8, edgecolor='black', capsize = 0.2, lw = 2, errwidth = 1, errcolor = '0.2')
ax.set_yticks([0, 0.1, 0.2])
ax.set_yticklabels(ax.get_yticks(), size = 16)
for axis in ['bottom', 'left']:
    ax.spines[axis].set_linewidth(2)
    ax.spines[axis].set_color('0.2')
    
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)


ax.set(
        title=None,
        ylabel='Uulaa-Tydyy Correct Syllables',
        xlabel=None,
        )


leg = plt.legend() 
ax.get_legend().remove()
plt.savefig('LASA_UULAAvsTYDY_C_syll_perc.jpg', bbox_inches='tight', dpi=300)
plt.show()
