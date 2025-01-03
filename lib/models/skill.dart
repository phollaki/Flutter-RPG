import 'package:rpg/models/vocation.dart';

class Skill {
  // constructor
  Skill({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.vocation,
  });

  // fields
  final String id;
  final String name;
  final String image;
  final String description;
  final Vocation vocation;
}

final List<Skill> allSkills = [
  // algo wizard skills
  Skill(
      id: '1',
      name: 'Brute Force Bolt',
      image: 'bf_bolt.jpg',
      vocation: Vocation.wizard,
      description:
          'Unleash a raw surge of computational power, striking enemies with relentless energy that bypasses finesse for sheer brute force.'),
  Skill(
      id: '2',
      name: 'Recursive Wave',
      image: 'r_wave.jpg',
      vocation: Vocation.wizard,
      description:
          'Summon an ever-repeating wave of magic, dealing increasing damage with each recursive iteration that hits the target.'),
  Skill(
      id: '3',
      name: 'Hash Beam',
      image: 'h_beam.jpg',
      vocation: Vocation.wizard,
      description:
          'Emit a focused beam of energy that hashes your enemies’ defenses, disrupting their patterns and dealing massive damage.'),
  Skill(
      id: '4',
      name: 'Backtrack',
      image: 'backtrack.jpg',
      vocation: Vocation.wizard,
      description:
          'Reverse time for a brief moment, undoing the last harmful effect on yourself or an ally while regaining lost ground.'),

  // terminal raider skills
  Skill(
      id: '5',
      name: 'Lethal Touch',
      image: 'l_touch.jpg',
      vocation: Vocation.raider,
      description:
          'Deliver a devastating strike to a critical point, instantly executing weakened enemies or dealing significant damage to stronger foes.'),
  Skill(
      id: '6',
      name: 'Sudo Blast',
      image: 's_blast.jpg',
      vocation: Vocation.raider,
      description:
          'Override your enemies\' defenses with an explosive pulse of terminal energy that leaves no room for resistance.'),
  Skill(
      id: '7',
      name: 'Full Clear',
      image: 'f_clear.jpg',
      vocation: Vocation.raider,
      description:
          'Sweep through the battlefield, eliminating all lingering threats and clearing obstacles with unmatched efficiency.'),
  Skill(
      id: '8',
      name: 'Support Shell',
      image: 's_shell.jpg',
      vocation: Vocation.raider,
      description:
          'Deploy a protective barrier around yourself or an ally, absorbing incoming damage and boosting resilience temporarily.'),

  // code junkie skills
  Skill(
      id: '9',
      name: 'Infinite Loop',
      image: 'i_loop.jpg',
      vocation: Vocation.junkie,
      description:
          'Trap your enemies in an endless cycle of damage, locking them in place and draining their strength with each repetition.'),
  Skill(
      id: '10',
      name: 'Type Cast',
      image: 't_cast.jpg',
      vocation: Vocation.junkie,
      description:
          'Forcefully adapt to your enemy’s weaknesses, changing the nature of your attacks to deal maximum damage.'),
  Skill(
      id: '11',
      name: 'Encapsulate',
      image: 'encapsulate.jpg',
      vocation: Vocation.junkie,
      description:
          'Create a shield of pure logic around yourself or an ally, isolating them from harm and regenerating their vitality over time.'),
  Skill(
      id: '12',
      name: 'Copy & Paste',
      image: 'c_paste.jpg',
      vocation: Vocation.junkie,
      description:
          'Duplicate the last skill or effect you used, amplifying its potency or redirecting it to a new target.'),

  // ux ninja skills
  Skill(
      id: '13',
      name: 'Gamify',
      image: 'gamify.jpg',
      vocation: Vocation.ninja,
      description:
          'Turn the tide of battle into a strategic game, boosting your team’s morale and increasing their effectiveness over time.'),
  Skill(
      id: '14',
      name: 'Heat Map',
      image: 'h_map.jpg',
      vocation: Vocation.ninja,
      description:
          'Reveal weak spots in your enemies\' defenses, highlighting critical points for your team to exploit.'),
  Skill(
      id: '15',
      name: 'Wireframe',
      image: 'wireframe.jpg',
      vocation: Vocation.ninja,
      description:
          'Project an illusionary structure that confuses enemies, forcing them to target decoys while you plan your next move.'),
  Skill(
      id: '16',
      name: 'Dark Pattern',
      image: 'd_pattern.jpg',
      vocation: Vocation.ninja,
      description:
          'Manipulate your foes with deceptive techniques, luring them into traps or causing them to act against their own interests.'),
];
