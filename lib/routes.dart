import 'tutorial.dart';
import 'views/views.dart';

final routes = {
  Tutorial.routeName: (_) => const Tutorial(),
  Home.routeName: (_) => const Home(),
  IntercorrenciasNaMama.routeName: (_) => const IntercorrenciasNaMama(),
  LeiteEmpedrado.routeName: (_) => LeiteEmpedrado(),
  FissurasNoMamilo.routeName: (_) => FissurasNoMamilo(),
  Mastite.routeName: (_) => Mastite(),
  BloqueioDeDuctos.routeName: (_) => BloqueioDeDuctos(),
  AbscessoMamario.routeName: (_) => AbscessoMamario(),
  PromocaoDeCuidados.routeName: (_) => const PromocaoDeCuidados(),
  PegaCorreta.routeName: (_) => PegaCorreta(),
  GuiaExtracaoManualDeLeite.routeName: (_) => GuiaExtracaoManualDeLeite(),
  QueixaDePoucoLeite.routeName: (_) => QueixaDePoucoLeite(),
  TiposDeMamilos.routeName: (_) => TiposDeMamilos(),
  DescidaDoLeite.routeName: (_) => DescidaDoLeite(),
  BebeNaoSuga.routeName: (_) => BebeNaoSuga(),
  OndeEncontrarAjuda.routeName: (_) => OndeEncontrarAjuda(),
  CronometroDeAmamentacao.routeName: (_) => const CronometroDeAmamentacao(),
  ChatDasMaes.routeName: (_) => const ChatDasMaes(),
  Sobre.routeName: (_) => Sobre()
};
