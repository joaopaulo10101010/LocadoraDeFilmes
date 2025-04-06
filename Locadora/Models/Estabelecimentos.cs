using System.Numerics;

namespace Locadora.Models
{
    public class Estabelecimentos
    {
        int cod_es {  get; }
        string nome_es { get; set; }
        string enderecoc_es { get; set; }
        string complemento { get; set; }
        string estado_uf { get; set; }
        string cnpj_es { get; set; }
        string servico_es { get; set; }
        int postosDeTrabalho { get; set; }
        double totalDosCustos { get; set; }
        double totalDasVendas { get; set; }
    }
}
