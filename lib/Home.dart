
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:riverpod_provider/core/common_widgets/Button.dart';
import 'core/Navigation/Navigation.dart';
import 'providers/provider/basic/DataScreen.dart' as basic_provider;
import 'providers/provider/auto_dispose/DataScreen.dart' as auto_dispose_provider;
import 'providers/provider/family/DataScreen.dart' as family_provider;
import 'providers/provider/auto_dispose_family/DataScreen.dart' as auto_dispose_family_provider;
import 'providers/provider/auto_dispose_keep_alive/DataScreen.dart' as auto_dispose_keep_alive_provider;
import 'providers/provider/auto_dispose_family_keep_alive/DataScreen.dart' as auto_dispose_family_keep_alive_provider;
import 'providers/state_provider/basic/CounterScreen.dart' as state_provider;
import 'providers/state_provider/auto_dispose/CounterScreen.dart' as auto_dispose_state_provider;
import 'providers/state_provider/proxy_behaviour/CounterScreen.dart' as proxy_state_provider;
import 'providers/state_provider/auto_dispose_family/CounterScreen.dart' as auto_dispose_family_state_provider;
import 'providers/future_provider/APIScreen.dart' as future_provider;
import 'providers/future_provider_keep_alive/APIScreen.dart' as future_provider_keep_alive;
import 'providers/stream_provider/ClockScreen.dart' as stream_provider;
import 'providers/state_notifier_provider/CounterScreen.dart' as state_notifier_provider;
import 'providers/change_notifier_provider/CounterScreen.dart' as change_notifier_provider;
import 'providers/notifier_provider/basic_provider/CounterScreen.dart' as notifier_provider;
import 'providers/notifier_provider/auto_dispose_provider/CounterScreen.dart' as auto_dispose_notifier_provider;
import 'providers/notifier_provider/auto_dispose_family_provider/CounterScreen.dart' as family_auto_dispose_notifier_provider;
import 'providers/async_notifier_provider/basic_provider/CounterScreen.dart' as async_notifier_provider;
import 'providers/async_notifier_provider/auto_dispose_provider/CounterScreen.dart' as auto_dispose_async_notifier_provider;
import 'providers/async_notifier_provider/auto_dispose_family_provider/CounterScreen.dart' as family_auto_dispose_async_notifier_provider;
import 'providers/stream_notifier_provider/basic_provider/ClockScreen.dart' as stream_notifier_provider;
import 'providers/stream_notifier_provider/auto_dispose_provider/ClockScreen.dart' as auto_dispose_stream_notifier_provider;
import 'providers/stream_notifier_provider/auto_dispose_family_provider/ClockScreen.dart' as family_auto_dispose_stream_notifier_provider;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      title: 'Home',
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppButton(text: 'Basic Provider (StatelessWidget)', onTab: () => Navigation.push(context, const basic_provider.DataScreen())),
              AppButton(text: 'Auto Dispose Provider (ConsumerWidget)', onTab: () => Navigation.push(context, const auto_dispose_provider.DataScreen())),
              AppButton(text: 'Family Provider (StatefulWidget)', onTab: () => Navigation.push(context, const family_provider.DataScreen())),
              AppButton(text: 'Auto Dispose Family Provider (ConsumerStatefulWidget)', onTab: () => Navigation.push(context, const auto_dispose_family_provider.DataScreen())),
              const Divider(),
              AppButton(text: 'Auto Dispose KeepAlive Provider', onTab: () => Navigation.push(context, const auto_dispose_keep_alive_provider.DataScreen())),
              AppButton(text: 'Auto Dispose Family KeepAlive Provider', onTab: () => Navigation.push(context, const auto_dispose_family_keep_alive_provider.DataScreen())),
              const Divider(),
              AppButton(text: 'State Provider', onTab: () => Navigation.push(context, const state_provider.CounterScreen())),
              AppButton(text: 'Auto dispose State Provider', onTab: () => Navigation.push(context, const auto_dispose_state_provider.CounterScreen())),
              AppButton(text: 'State Provider (Proxy Behaviour)', onTab: () => Navigation.push(context, const proxy_state_provider.CounterScreen())),
              AppButton(text: 'Auto dispose Family State Provider', onTab: () => Navigation.push(context, auto_dispose_family_state_provider.CounterScreen())),
              const Divider(),
              AppButton(text: 'Future Provider', onTab: () => Navigation.push(context, const future_provider.APIScreen())),
              AppButton(text: 'Future Provider (Keep Alive)', onTab: () => Navigation.push(context, const future_provider_keep_alive.APIScreen())),
              const Divider(),
              AppButton(text: 'Stream Provider', onTab: () => Navigation.push(context, const stream_provider.ClockScreen())),
              const Divider(),
              AppButton(text: 'State Notifier Provider', onTab: () => Navigation.push(context, state_notifier_provider.CounterScreen())),
              const Divider(),
              AppButton(text: 'Change Notifier Provider', onTab: () => Navigation.push(context, change_notifier_provider.CounterScreen())),
              const Divider(),
              AppButton(text: 'Notifier Provider', onTab: () => Navigation.push(context, const notifier_provider.CounterScreen())),
              AppButton(text: 'Auto Dispose Notifier Provider', onTab: () => Navigation.push(context, const auto_dispose_notifier_provider.CounterScreen())),
              AppButton(text: 'Auto Dispose Family Notifier Provider', onTab: () => Navigation.push(context, family_auto_dispose_notifier_provider.CounterScreen())),
              const Divider(),
              AppButton(text: 'Async Notifier Provider', onTab: () => Navigation.push(context, const async_notifier_provider.CounterScreen())),
              AppButton(text: 'Auto Dispose Async Notifier Provider', onTab: () => Navigation.push(context, const auto_dispose_async_notifier_provider.CounterScreen())),
              AppButton(text: 'Auto Dispose Family Async Notifier Provider', onTab: () => Navigation.push(context, family_auto_dispose_async_notifier_provider.CounterScreen())),
              const Divider(),
              AppButton(text: 'Stream Notifier Provider', onTab: () => Navigation.push(context, const stream_notifier_provider.ClockScreen())),
              AppButton(text: 'Auto Dispose Stream Notifier Provider', onTab: () => Navigation.push(context, const auto_dispose_stream_notifier_provider.ClockScreen())),
              AppButton(text: 'Auto Dispose Family Stream Notifier Provider', onTab: () => Navigation.push(context, family_auto_dispose_stream_notifier_provider.ClockScreen())),
              const Divider()
            ]
          )
        )
      )
    );
  }

}