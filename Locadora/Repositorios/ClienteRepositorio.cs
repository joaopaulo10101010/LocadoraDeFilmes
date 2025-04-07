using MySqlX.XDevAPI;
using Locadora.Models;
using MySql.Data.MySqlClient;

namespace Locadora.Repositorios
{

    // Program.cs ja recebeu sua dependencia
    public class ClienteRepositorio
    {
        private readonly string _stringconnection;


        public ClienteRepositorio(IConfiguration stringconnection)
        {
            _stringconnection = stringconnection.GetConnectionString("MySqlConnection");
        }


        public void AdicionarCliente(Clientes clientes)
        {
            using (var banco = new ConexaoMySQL(_stringconnection))
            {
                var bancocmd = banco.MySqlCommand();
                bancocmd.CommandText = "INSERT INTO Clientes (usuario_cli, senha_cli, nome_cli, cpf_cli, cep_cli, endereco, complemento_cli, estado_uf, observacao) VALUES (@usuario, @senha, @nome, @cpf, @cep, @endereco, @complemento, @estado, @observacao)";
                bancocmd.Parameters.AddWithValue("@usuario", clientes.usuario_cli);
                bancocmd.Parameters.AddWithValue("@senha", clientes.senha_cli);
                bancocmd.Parameters.AddWithValue("@nome", clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@cpf", clientes.cpf_cli);
                bancocmd.Parameters.AddWithValue("@cep", clientes.cep_cli);
                bancocmd.Parameters.AddWithValue("@endereco", clientes.endereco);
                bancocmd.Parameters.AddWithValue("@complemento", clientes.complemento_cli);
                bancocmd.Parameters.AddWithValue("@estado", clientes.estado_uf);
                bancocmd.Parameters.AddWithValue("@observacao", clientes.observacao);
                Console.WriteLine(bancocmd.CommandText);
                bancocmd.ExecuteNonQuery();
            }
        }
        public Clientes ProcurarCliente(string cod_cli)
        {
            using (var banco = new ConexaoMySQL(_stringconnection))
            {
                var bancocmd = banco.MySqlCommand();
                bancocmd.CommandText = "Select * from Clientes where cod_cli='@cod_cli'";
                bancocmd.Parameters.AddWithValue("@cod_cli", cod_cli);
                bancocmd.ExecuteNonQuery();


                using (var leitor = bancocmd.ExecuteReader())
                {
                    if (leitor.Read())
                    {
                        return new Clientes
                        {
                            cod_cli = leitor.GetInt32("cod_cli"),
                            usuario_cli = leitor.GetString("usuario_cli"),
                            senha_cli = leitor.GetString("senha_cli"),
                            nome_cli = leitor.GetString("nome_cli"),
                            cpf_cli = leitor.GetString("cpf_cli"),
                            cep_cli = leitor.GetString("cep_cli"),
                            endereco = leitor.GetString("endereco"),
                            complemento_cli = leitor.GetString("complemento_cli"),
                            estado_uf = leitor.GetString("estado_uf"),
                            observacao = leitor.GetString("observacao"),
                        };
                    }
                    return null;
                }
            }  
        }





    }
}
