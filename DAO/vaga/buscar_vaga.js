import {conexao} from '../conexao.js'

export default async function buscarVaga(){
  const realizarConexao = await conexao();
  try{
    const sql = `SELECT * FROM vaga_tbl`;

    const [rows] = await realizarConexao.query(sql);

    return rows;
  } catch(error){
    console.log("Erro ao buscar vagas" + error)
  }
}