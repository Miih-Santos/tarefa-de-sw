import express from "express";
import buscarVaga from "../../DAO/vaga/buscar_vaga.js"
const router = express.Router();


router.get('/', async (req,res) => {
    try{
        let resp = await buscarVaga();
        res.json({Consulta: resp})
    } catch(error){
        console.error(error)
        res.status(500).json({Erro: "Erro ao buscar tabela em banco de dados"})
    }
})

export default router;