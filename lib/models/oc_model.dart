class OC {
  final String ocNum;
  final String cnpj;
  final String fornecedor;
  final String emissao;
  final String nota;

  const OC({
    required this.ocNum,
    required this.cnpj,
    required this.fornecedor,
    required this.emissao,
    required this.nota,
  });

  OC copy({
    String? ocNum,
    String? cnpj,
    String? fornecedor,
    String? emissao,
    String? nota,
  }) =>
      OC(
        ocNum: ocNum ?? this.ocNum,
        cnpj: cnpj ?? this.cnpj,
        fornecedor: fornecedor ?? this.fornecedor,
        emissao: emissao ?? this.emissao,
        nota: nota ?? this.nota,
      );
}
