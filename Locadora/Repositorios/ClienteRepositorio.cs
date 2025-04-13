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
                bancocmd.CommandText = "INSERT INTO Clientes (usuario_cli, senha_cli, nome_cli, cpf_cli, cep_cli, endereco, complemento_cli, estado_uf, pontos_cli, observacao) VALUES (@usuario, @senha, @nome, @cpf, @cep, @endereco, @complemento, @estado, @pontos, @observacao)";
                bancocmd.Parameters.AddWithValue("@usuario", clientes.usuario_cli);
                bancocmd.Parameters.AddWithValue("@senha", clientes.senha_cli);
                bancocmd.Parameters.AddWithValue("@nome", clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@cpf", clientes.cpf_cli);
                bancocmd.Parameters.AddWithValue("@cep", clientes.cep_cli);
                bancocmd.Parameters.AddWithValue("@endereco", clientes.endereco);
                bancocmd.Parameters.AddWithValue("@complemento", clientes.complemento_cli);
                bancocmd.Parameters.AddWithValue("@estado", clientes.estado_uf);
                bancocmd.Parameters.AddWithValue("@pontos", clientes.pontos_cli);
                bancocmd.Parameters.AddWithValue("@observacao", clientes.observacao);
                bancocmd.ExecuteNonQuery();
            }
        }
        public Clientes ProcurarCliente(string cpf_cli)
        {
            try
            {
                using (var banco = new ConexaoMySQL(_stringconnection))
                {
                    var bancocmd = banco.MySqlCommand();
                    bancocmd.CommandText = "SELECT * FROM Clientes WHERE cpf_cli = @cpf_cli";
                    bancocmd.Parameters.AddWithValue("@cpf_cli", cpf_cli);

                    using (var leitor = bancocmd.ExecuteReader())
                    {
                        if (leitor.Read())
                        {
                            return new Clientes
                            {
                                usuario_cli = leitor.GetString("usuario_cli"),
                                senha_cli = leitor.GetString("senha_cli"),
                                nome_cli = leitor.GetString("nome_cli"),
                                cpf_cli = leitor.GetString("cpf_cli"),
                                cep_cli = leitor.GetString("cep_cli"),
                                endereco = leitor.GetString("endereco"),
                                complemento_cli = leitor.GetString("complemento_cli"),
                                estado_uf = leitor.GetString("estado_uf"),
                                pontos_cli = leitor.GetInt32("pontos_cli"),
                                observacao = leitor.GetString("observacao"),
                            };
                        }
                    }
                }

                return null;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao procurar cliente: {ex.Message}");
                return null;
            }
        }






    }
}
