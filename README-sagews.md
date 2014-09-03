# README file for SageMathCloud (SMC) worksheets

Files with extension of .sagews are meant to be run in SageMathCloud, a free service for scientific computing.

## Quick-start instructions for running an SMC worksheet

If you want to try running a .sagews file, do the following:

1. Create an account at https://cloud.sagemath.com/. All that is required is an email address and a password.
2. Sign into your account and create a project.
3. Open the project. You now have access to a virtual machine running Ubuntu.
4.  At this point you have two options:
  1. *Upload the .sagews file.* Click New toward the top of the page and either drag the file into the drop area with your mouse,  or click in the drop area to get a file selection menu.
  2. *Clone a repo from github.* Click New toward the top of the page. Open a terminal session. Use your mouse to copy the HTTPS URL for the github repo you want to clone, and type
        git clone <URL of the github repo>
After the repository is cloned, you can use the Files explorer to find the .sagews file and open it.
5. Like an IPython notebook, the worksheet is divided into cells. You can use the play button at the top to execute the cell containing the cursor, or click shift-enter to do the same thing.

## Online tutorials

[5-minute SMC tutorial for IPython users](https://www.youtube.com/watch?v=cR0JV8bmUt0)

[30-minute intro to SMC by William Stein, ](https://www.youtube.com/watch?v=_vmJiZ-I7Kc)

[intro to Sage and SageMathCloud by William Stein - SMC starts at 9:45](http://youtu.be/qjQuPSTzIKc?t=9m45s)

## SageMathCloud worksheets in this repository:

- 01_01_Phugoid_Theory_sage.sagews - transcription of [01_01_Phugoid_Theory.ipynb](https://github.com/numerical-mooc/numerical-mooc/blob/master/lessons/01_phugoid/01_01_Phugoid_Theory.ipynb) into Sage symbolic expressions. This is a work in progress. I'm learning as I go. If you see a better way to do some of the calculations, I'd love to know.
