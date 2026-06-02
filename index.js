import express from 'express';
import {testarConexao} from "./DAO/conexao.js";
import cors from "cors";

//Importações do roteador
import buscarRegistros from "./routes/consultas/consultasRegistro-route.js";
import buscarEnderecos from "./routes/consultas/consultasEndereco-route.js";
import buscarVagas from "./routes/consultas/consultasVagas-route.js";
import buscarVeiculos from "./routes/consultas/consultaVeiculo.js";

const door = 3000;

const app = express();

app.use(express.json(), cors());


app.get('/', (req, res) =>{
    res.json('Olá, Mundo!')
});

app.use('/BuscarRegistro', buscarRegistros);

app.use('/BuscarEndereco', buscarEnderecos);

app.use('/BuscarVaga', buscarVagas);

app.use('/BuscarVeiculo', buscarVeiculos);

app.listen(door, () => {
    testarConexao();
    console.log('Server is running on http://localhost:3000');
});
