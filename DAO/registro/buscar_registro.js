import {conexao} from "../conexao.js";

export default async function buscarRegistro(){
  const realizarConexao = await conexao();

  try{
    const sql = `SELECT * FROM registro_tbl`;
  
    const [rows] = await realizarConexao.query(sql);
  
    return rows;
  } catch(error){
    console.error("Erro ao fazer consulta dos registros:" + error)
    
  }
};