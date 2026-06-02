import express from "express";
const router = express.Router()
import buscarEndereco from "../../DAO/endereco/buscar_endereco.js";

router.get("/", async (req,res) => {
    try {
        let resposta = await buscarEndereco()
        res.json({ Consulta: resposta })
    } catch (error) {
        console.error(error)
        res.status(500).json({erro: error})
    }
})

export default router