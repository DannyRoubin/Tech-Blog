const router = require("express").Router();
const { Blog, Comment, User } = require("../../models");
const withAuth = require("../../utils/auth");

router.get("/:id", withAuth, async (req, res) => {
  try {
    const blogData = await Blog.findByPk(req.params.id, {
      include: [
        {
          model: Comment,
          attributes: ["comment_body", "comment_date", "blog_id", "user_id"],
          include: [
            {
              model: User,
              attributes: ["name"],
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

    res.render("update", { blogs, logged_in: req.session.logged_in });
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
      },
    });

    if (!blogData) {
      res.status(404).json({ message: "No blog matching this id was found" });
      return;
    }

    res.status(200).json(blogData);
  } catch (err) {
    res.status(500).json(err);
  }
});

router.put("/:id", withAuth, async (req, res) => {
  try {
    const blogData = await Blog.update(
      {
        blog_title: req.body.blog_title,
        blog_body: req.body.blog_body,
      },
      {
        where: {
          id: req.params.id,
        },
      }
    );

    res.status(200).json(blogData);
  } catch (err) {
    res.status(500).json(err);
  }
});

module.exports = router;
