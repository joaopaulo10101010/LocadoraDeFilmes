using MySqlX.XDevAPI;
using Locadora.Models;

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
                bancocmd.CommandText = "INSERT INTO Clientes (nome_cli, cpf_cli, cep_cli, endereco, complemento_cli, estado_uf, observacao) VALUES (@nome, @cpf, @cep, @endereco, @complemento, @estado, @observacao)";
                bancocmd.Parameters.AddWithValue("@nome",clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@cpf", clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@cep", clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@endereco", clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@complemento", clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@estado", clientes.nome_cli);
                bancocmd.Parameters.AddWithValue("@observacao", clientes.nome_cli);
                bancocmd.ExecuteNonQuery();

            }

        }





    }
}
