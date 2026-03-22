import express from "express";
import pool from "../config/db.js";

const router = express.Router();

router.post("/", async (req, res) => {
    try {
        const { name, message, rating } = req.body;

        await pool.query(
            "INSERT INTO reviews (name, message, rating) VALUES ($1, $2, $3)",
            [name, message, rating]
        );

        res.json({ success: true });

    } catch (err) {
        console.error("DB ERROR:", err.message);
        res.status(500).json({ error: err.message });
    }
});

router.get("/", async (req, res) => {
    try {
        const result = await pool.query(
            "SELECT * FROM reviews ORDER BY id DESC"
        );

        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Server error" });
    }
});

export default router;