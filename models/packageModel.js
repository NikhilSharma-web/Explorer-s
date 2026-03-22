import pool from "../config/db.js";

export const getPackageBySlug = async (slug) => {
    const result = await pool.query(
        `
        SELECT 
            p.id,
            p.title,
            p.duration,
            p.price,
            p.includes,
            d.name,
            d.image
        FROM packages p
        JOIN destinations d 
            ON p.destination_id = d.id
        WHERE d.slug = $1
        `,
        [slug]
    );

    return result.rows;
};