const router = require("express").Router();
const { Comment } = require("../../models");
const withAuth = require("../../utils/auth");

// delete comment by id
router.delete("/:id", withAuth, async (req, res) => {
  try {
    const commentData = await Comment.destroy({
      where: {
        id: req.params.id,
      },
    });

    if (!commentData) {
      res.status(404).json({ message: "No comment matched that id" });
      return;
    }

    res.status(200).json("");
  } catch (err) {
    res.status(500).json(err);
  }
});

module.exports = router;
