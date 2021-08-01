const router = require("express").Router();
const { Blog, Comment, User } = require("../../models");
const withAuth = require("../../utils/auth");

//create a blog
router.post("/", withAuth, async (req, res) => {
  try {
    const newBlog = await Blog.create({
      ...req.body,
      user_id: req.session.user_id,
    });

    res.status(200).json(newBlog);
  } catch (err) {
    res.status(500).json(err);
  }
});

// add a comment to a blog
router.post("/:id", withAuth, async (req, res) => {
  try {
    const newComment = await Comment.create({
      comment_body: req.body.comment_body,
      user_id: req.session.user_id,
      blog_id: req.params.id,
    });

    res.status(200).json(newComment);
  } catch (err) {
    res.status(500).json(err);
  }
});

// view a blog by the blog id and combine with comment model and user model
router.get("/:id", async (req, res) => {
  req.session.loggedIn = true;

  try {
    const blogData = await Blog.findByPk(req.params.id, {
      include: [
        {
          model: Comment,
          attributes: [
            "id",
            "comment_body",
            "comment_date",
            "blog_id",
            "user_id",
          ],
          include: [
            {
              model: User,
              attribtes: ["name"],
            },
          ],
        },
        {
          model: User,
          attributes: ["id", "name"],
        },
      ],
    });

    const blogs = blogData.get({ plain: true });

    const commentInfo = await Blog.findByPk(req.params.id, {
      include: [
        {
          model: Comment,
          attributes: ["user_id"],
        },
      ],
    });

    var currentUser = commentInfo.get({ plain: true });

    res.render("blog", {
      blogs,
      currentUser,
      sessUserId: req.session.user_id,
      logged_in: req.session.logged_in,
    });
    console.log(res);
  } catch (err) {
    res.status(500).json(err);
  }
});

// delete blogs by blog id
router.delete("/:id", withAuth, async (req, res) => {
  try {
    const blogData = await Blog.destroy({
      where: {
        id: req.params.id,
        user_id: req.session.user_id,
      },
    });

    if (!blogData) {
      res
        .status(404)
        .json({ message: "Could not find a blog matching this id" });
      return;
    }

    res.status(200).json(blogData);
    res.render("blogs", { blogData });
  } catch (err) {
    res.status(500).json(err);
  }
});

module.exports = router;
