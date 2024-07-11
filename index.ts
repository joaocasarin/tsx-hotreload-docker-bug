import express, { Request, Response } from "express";

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get("", (req: Request, res: Response) => {
    const { query } = req;

    return res.send({ query });
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});
