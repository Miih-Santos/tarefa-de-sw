import express from "express";
import buscarVeiculo from "../../DAO/veiculo/buscar_veiculo.js";
const router = express.Router()

router.get('/', async(req,res)=>{
    try {
        let resp =  await buscarVeiculo()
        res.json({Consulta: resp})
    } catch (error) {
        console.error(error)
        res.status(500).json(error)
    }
})

export default router