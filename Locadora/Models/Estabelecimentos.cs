using System.Numerics;

namespace Locadora.Models
{
    public class Estabelecimentos
    {
        public int cod_es {  get; }
        public string nome_es { get; set; }
        public string cnpj { get; set; }
        public string cep { get; set; }
        public string endereco { get; set; }
        public string complemento { get; set; }
        public string estado_uf { get; set; }
        public decimal valorArecadado { get; set; }
        public decimal ValorGasto { get; set; }
    }
}
