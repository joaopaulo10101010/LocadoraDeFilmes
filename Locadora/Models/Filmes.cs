namespace Locadora.Models
{
    public class Filmes
    {
        int filme_cod { get; }
        string filme_nome {  get; set; }
        string filme_produto { get; set; }
        string filme_genero { get; set; }
        double filme_preco { get; set; }
        int filme_pontos { get; set; }
        int filme_ano { get; set; }
        int filme_quantidade { get; set; }
    }
}
