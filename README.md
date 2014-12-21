Numerical MOOC Assignment Bank
===============

## Contribute alternative assignments for "Practical Numerical Methods with Python"

In this course, we believe that what matters is what YOU do. The course content created by the instructors is just the skeleton, to which you have to add flesh and blood to bring it to life.

Did you find a related problem that illustrates one of the concepts we discuss in the course? Did you write an alternative version of a code? Do you want to challenge your peers? Contribute here!

## Guidelines for contributors

### Notebook naming
Use a distinctive title for your notebook. (We're trying to sort out a good way to organize contributions. Stay tuned.)

### Notebook sectioning
Use section headings and organize your writing and your code making the notebook easy to scan. Split code cells if they become too long, and add explanations of what the code is doing, as necessary.

### Notebook style
You can apply the numerical-mooc CSS style to your notebook by including the following code in a cell at the bottom of your notebook (but check that the folder location works with your file, or modify as needed):

```Python
from IPython.core.display import HTML
css_file = '../../styles/numericalmoocstyle.css'
HTML(open(css_file, "r").read())
```

The path to `css_file` above assumes that your notebook is located *two* folders down from the root of the repository, e.g.

```
  assignment-bank/
    assignments-folder/
      your-assignment/
        your_notebook.ipynb
```

### Copyright notice
Remember to add your authorship on your contributions via a copyright notice somewhere (you of course retain copyright of all that you create). We encourage you to license your content under a Creative Commons license, for others to reuse. CC-BY 4.0 is recommended for your creative works, and MIT license for code: these are permissive, non-intrusive, liberal licenses that ensure you will get credit for your work while having the most impact.
