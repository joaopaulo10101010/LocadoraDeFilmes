namespace Locadora.Models
{
    public class Filmes
    {
        public int filme_cod { get; }
        public string filme_nome {  get; set; }
        public string filme_produto { get; set; }
        public string filme_genero { get; set; }
        public double filme_preco { get; set; }
        public int filme_pontos { get; set; }
        public int filme_ano { get; set; }
        public int filme_quantidade { get; set; }
    }
}
