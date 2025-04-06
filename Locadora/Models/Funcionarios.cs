namespace Locadora.Models
{
    public class Funcionarios
    {
        int func_cod { get; }
        int cod_es { get; set; }
        string usuario_func {  get; set; }
        string senha_func { get; set; }
        string nome_func { get; set; }
        string cpf_func { get; set; }
        string cargo_func { get; set; }
        double salario_func { get; set; }
        DateTime data_admissao { get; set; }
        bool ativo {  get; set; }
        
    }
}
