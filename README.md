## Letter Drawing Lynx Motion Arm

Lynxmotion arm is a 5R serial robot manipulator with 2 spherical and 3 revolute joints. This work presents the forward and inverse kinematics of the arm in implementing a task of drawing a letter "W".
This was experimented in Matlab software using the Robotics Toolbox library. 

Robotics Toolbox provides tools and algorithms for designing, simulating, and testing manipulators, mobile robots, and humanoid robots. 


## Forward Kinematics

Forward kinematics deals with computing the end-effector position with the provided joint angles. This problem can be solved in two ways
1)	Homogeneous transformations between successive frames.
2)	DH Notation approach.
DH notation is the fastest way of computing the end-effector position.

## DH Notation

This approach attaches a coordinate frame at each joint and specifies four parameters known as DH parameters for each link. Using DH parameters, DH table is created to obtain the transformation matrix between coordinate frames.



You can use the [editor on GitHub](https://github.com/PavanproJack/LetterDrawingRobotArm/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1123
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/PavanproJack/LetterDrawingRobotArm/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
