namespace Locadora.Models
{
    public class Funcionarios
    {
        public int cod_es { get; set; }
        public string usuario_fun {  get; set; }
        public string senha_fun { get; set; }
        public string nome_fun { get; set; }
        public string cpf_fun { get; set; }
        public string cep_fun { get; set; }
        public string endereço_fun { get; set; }
        public string? complemento_fun { get; set; }
        public string estado_uf {  get; set; }
        public string cargo_fun { get; set; }
        public decimal salario_fun { get; set; }
        
    }
}
