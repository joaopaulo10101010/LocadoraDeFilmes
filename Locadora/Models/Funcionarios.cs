namespace Locadora.Models
{
    public class Funcionarios
    {
        public int func_cod { get; }
        public int cod_es { get; set; }
        public string usuario_func {  get; set; }
        public string senha_func { get; set; }
        public string nome_func { get; set; }
        public string cpf_func { get; set; }
        public string cargo_func { get; set; }
        public double salario_func { get; set; }
        public DateTime data_admissao { get; set; }
        public bool ativo {  get; set; }
        
    }
}
