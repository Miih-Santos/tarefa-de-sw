import express from "express"
const router = express.Router();
import buscarRegistro from "../../DAO/registro/buscar_registro.js";

router.get("/", async (req, res) => {
    try {
        let resp = await buscarRegistro();
        res.json({ Consulta: resp });
    } catch (error) {
        console.error(error)
        res.status(500).json({ erro: error })
    }
});

export default router;