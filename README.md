## Letter Drawing Lynx Motion Arm

Lynxmotion arm is a 5R serial robot manipulator with 2 spherical and 3 revolute joints. This work presents the forward and inverse kinematics of the arm in implementing a task of drawing a letter "W".
This was experimented in Matlab software using the Robotics Toolbox library. 

Robotics Toolbox provides tools and algorithms for designing, simulating, and testing manipulators, mobile robots, and humanoid robots. 


## Forward Kinematics

Forward kinematics deals with computing the end-effector position with the provided joint angles. This problem can be solved in two ways
1)	Homogeneous transformations between successive frames.
2)	DH Notation approach.

DH notation is the fastest way of computing the end-effector position.

### DH Notation

This approach attaches a coordinate frame at each joint and specifies four parameters known as DH parameters for each link. Using DH parameters, DH table is created to obtain the transformation matrix between coordinate frames.

#### Preliminary Rules: 
1.	You must have at least one more frame than there are joints - one frame must be on the end effector
2.	All axes must be drawn either up, down, right, left or in the first or third quadrant.
3.	The Z-axis must be the axis of revolution or the direction of motion
4.	The X-axis must be perpendicular to the Z-axis of the frame before it.
5.	The Y-axis must be drawn so the whole frame follows the right-hand rule.


| Frame(i) | θ | 𝜶 | r | d |
|-------|--------|---------|--------|---------|
| 1 | θ1 | 90 | 0 | L1 |
| 2 | θ2 | 0 | L2 | 0 |
| 3 | θ3 | 0 | L3 | 0 |
| 4 | θ4 + 90 | -90 | L4 | 0 |
| 5 | θ5 | 0 | 0 | L5 |


#### Workspace Plotting:
A really important consideration with any robot is the set of all possible points that it can reach and we refer to this volume as workspace of the robot. It also shows the volume around the body where it cannot reach either. And this is due to mechanical limits on the range of motion of particular joints.Here we plot the workspace of the Lynx motion robot with all possible joint angles within their corresponding joint limits.

Script for plotting workspace can be found in WorkSpace.m file.
<img src = "WorkspaceXY.png" >
<img src = "Workspace XZ axes.png" >
<img src = "Workspace YZ axes.png" >
<img src = "WorkspaceXYZ axes.png" >





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
