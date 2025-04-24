import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Stores/Certificado/certificadoStore.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/RespuestaPreguntaEntity.dart';
import 'package:upcpro_app/Presentation/Screens/Question/widgets/OptionQuestion.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({super.key, required this.question});

  final RespuestaPreguntaEntity question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late String nameCompetence = "Sin Competencia";
  final storeGeneric = GetIt.instance<StoreGeneric>();
  final storeCertificado = GetIt.instance<StoreCertificado>();

  int? selectedOption;
  bool _isContextExpanded = false;

  void _handleSelect(int index) {
    storeCertificado.optionSelected = index;
    setState(() {
      selectedOption = index;
    });
  }

  void _toggleContextExpansion() {
    setState(() {
      _isContextExpanded = !_isContextExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    for (var competence in storeGeneric.competences) {
      if (widget.question.idCompetence == competence.id) {
        nameCompetence = competence.name;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasContext =
        widget.question.infoQuestion != null &&
        widget.question.infoQuestion!.context.isNotEmpty;
    final hasImage =
        widget.question.infoQuestion != null &&
        widget.question.infoQuestion!.image.isNotEmpty;

    final hasContextContent = hasContext || hasImage;

    return Column(
      children: [
        Container(
          height: fullHeight(context) * 0.8,
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nameCompetence,
                      style: textStyle(
                        colortext: const Color.fromARGB(255, 78, 176, 40),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                if (hasContextContent)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contexto:",
                        style: textStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          colortext: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),

                      if (hasContext)
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.question.infoQuestion!.context,
                                  style: const TextStyle(fontSize: 15),
                                  maxLines: _isContextExpanded ? null : 3,
                                  overflow:
                                      _isContextExpanded
                                          ? null
                                          : TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            );
                          },
                        ),

                      if (hasImage && (_isContextExpanded || !hasContext))
                      widget.question.infoQuestion!.image != "string" ?  Column(
                          children: [
                            const SizedBox(height: 16),
                            Center(
                              child: Image.network(
                                widget.question.infoQuestion!.image,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ) : Container(),

                      if (hasContext)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: GestureDetector(
                            onTap: _toggleContextExpansion,
                            child: Text(
                              _isContextExpanded ? "Ver menos" : "Ver más",
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                      const SizedBox(height: 16),
                    ],
                  ),

                Text(
                  widget.question.enunciated,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24),

                OptionQuestion(
                  answer: widget.question.optionA,
                  letter: 'A',
                  index: 1,
                  selectedOption: selectedOption,
                  onSelect: _handleSelect,
                ),
                OptionQuestion(
                  answer: widget.question.optionB,
                  letter: 'B',
                  index: 2,
                  selectedOption: selectedOption,
                  onSelect: _handleSelect,
                ),
                OptionQuestion(
                  answer: widget.question.optionC,
                  letter: 'C',
                  index: 3,
                  selectedOption: selectedOption,
                  onSelect: _handleSelect,
                ),
                OptionQuestion(
                  answer: widget.question.optionD,
                  letter: 'D',
                  index: 4,
                  selectedOption: selectedOption,
                  onSelect: _handleSelect,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
