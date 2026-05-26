import express from 'express';
import {conexao, testarConexao} from "./DAO/conexao.js";

const door = 3000;

const app = express();

app.use(express.json());

conexao();

app.get('/', (req, res) =>{
    res.json('Olá, Mundo!')
})

app.get('/registro', async (req,res)=>{
    try{
        const [rows] = await conexao.query("SELECT * FROM  registro_tbl")

        return res.json({ "Consulta": rows });
    } catch(error){
        console.error(error + ", Erro ao buscar registro no banco de dados")
        res.status(500).json({error: ", Erro ao buscar registro no banco de dados"})
    }
})

app.listen(door, () => {
    testarConexao();
    console.log('Server is running on http://localhost:3000');
})
