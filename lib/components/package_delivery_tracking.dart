import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';



const kTileHeight = 50.0;

class PackageDeliveryTrackingPage extends StatelessWidget {
  const PackageDeliveryTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5000,
      width: 50,
      child: ListView.builder(
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          final data = _data(index + 1);
          return Center(
            child: Container(
              width: 360.0,
              child: Card(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _DeliveryProcesses(processes: data.deliveryProcesses),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
    required this.start,
    required this.end,
  });

  final bool start;
  final bool end;

  final List<_DeliveryMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
            thickness: 1.0,
          ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
            size: 10.0,
            position: 0.5,
          ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
          !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
          isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<_DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5, // this is the inner timeline
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // Major text and balls
                    Text(
                      processes[index].name, // major text
                      style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: 18.0,
                      ),
                    ),

                    // Minor text and balls
                    _InnerTimeline(messages: processes[index].messages, start: false, end: false,),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return DotIndicator(
                  color: Color(0xff66c97f),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
              } else {
                return OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: processes[index].isCompleted ? Color(0xff66c97f) : null,
            ),
          ),
        ),
      ),
    );
  }
}



_OrderInfo _data(int id) => _OrderInfo(
  id: id,
  date: DateTime.now(),

  deliveryProcesses: [
    _DeliveryProcess(
      'Package Process',
      messages: [
        _DeliveryMessage('8:30am', ' received by driver'),
        _DeliveryMessage('11:30am', 'Reached halfway mark '),
      ],
    ),

    _DeliveryProcess.complete(),
  ],
);

class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final List<_DeliveryProcess> deliveryProcesses;
}



class _DeliveryProcess {
  const _DeliveryProcess(
      this.name, {
        this.messages = const [],
      });

  const _DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];

  final String name;
  final List<_DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}