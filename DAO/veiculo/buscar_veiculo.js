import { conexao } from "../conexao.js";

export default async function buscarVeiculo() {
  const realizarConexao = await conexao()
  try {
    const sql = `SELECT * FROM veiculo_tbl`
    const [rows] = await realizarConexao.query(sql)

    return rows
  } catch (error) {
    console.error("Não foi possivel selecionar a tabela: " + error)
  }
}