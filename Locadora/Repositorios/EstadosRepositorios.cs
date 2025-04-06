using System.Reflection.PortableExecutable;
using Locadora.Models;

namespace Locadora.Repositorios
{
    public class EstadosRepositorios
    {
        private readonly string _stringconnection;


        public EstadosRepositorios(IConfiguration stringconnection)
        {
            _stringconnection = stringconnection.GetConnectionString("MySqlConnection");
        }

        public Estados ProcurarEstado(string uf)
        {
            using (var banco = new ConexaoMySQL(_stringconnection))
            {
                var bancocmd = banco.MySqlCommand();
                bancocmd.CommandText = "select * from Estados where estado_uf='@uf'";
                bancocmd.Parameters.AddWithValue("@uf", uf);
                bancocmd.ExecuteNonQuery();


                using (var leitor = bancocmd.ExecuteReader())
                {
                    if (leitor.Read())
                    {
                        return new Estados
                        {
                            estado_uf = leitor.GetString("@estado_uf"),
                            estado_nome = leitor.GetString("@estado_nome"),
                        };
                    }
                    return null;
                }
            }
        }





    }
}
