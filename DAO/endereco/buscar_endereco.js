import { conexao } from "../conexao.js";

export default async function buscarEndereco() {
  const realizarConexao = await conexao()

  try {
    const sql = `SELECT * FROM endereco_tbl`
    const [rows] =  await realizarConexao.query(sql)

    return rows
  } catch (error) {
    console.error("Erro ao consultar a tabela de endereço" + error)
  }
}