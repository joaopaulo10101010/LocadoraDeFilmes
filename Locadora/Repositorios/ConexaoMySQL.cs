



using System.Data;
using MySql.Data.MySqlClient;

namespace Locadora.Repositorios
{
    public class ConexaoMySQL : IDisposable
    {
        private MySqlConnection _connection;

        public ConexaoMySQL(string connectionString)
        {
            _connection = new MySqlConnection(connectionString);
            _connection.Open();
        }

        public MySqlCommand MySqlCommand()
        {
            return _connection.CreateCommand();
        }

        public void Dispose()
        {
            if (_connection != null && _connection.State == ConnectionState.Open)
            {
                _connection.Close();
                _connection.Dispose();
            }
        }


    }
}
