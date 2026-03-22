import pool from "../config/db.js";

export const saveContact = async (name, email, phone, message) => {
    const query = `
    INSERT INTO contacts (name, email, phone, message)
    VALUES($1, $2, $3, $4)
    RETURNING *;
    `;

    const values = [name, email, phone, message];

    const result = await pool.query(query, values);
    return result.rows[0];
};