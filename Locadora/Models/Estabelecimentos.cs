using System.Numerics;

namespace Locadora.Models
{
    public class Estabelecimentos
    {
        public int cod_es {  get; }
        public string nome_es { get; set; }
        public string enderecoc_es { get; set; }
        public string complemento { get; set; }
        public string estado_uf { get; set; }
        public string cnpj_es { get; set; }
        public string servico_es { get; set; }
        public int postosDeTrabalho { get; set; }
        public double totalDosCustos { get; set; }
        public double totalDasVendas { get; set; }
    }
}
