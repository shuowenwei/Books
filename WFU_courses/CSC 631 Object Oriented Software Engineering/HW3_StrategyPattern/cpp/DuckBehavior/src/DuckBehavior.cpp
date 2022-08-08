
// Homework 3
// by Shuowen Wei

#include <iostream>
using namespace std;

//  Quack and fly interfaces
class QuackBehavior
{
	public:
		virtual void quack() = 0;
};

class FlyBehavior
{
	public:
		virtual void fly() = 0;
};

// concrete Quack and fly behaviors
class Quack : public QuackBehavior
{
	public:
		void quack()
		{
			cout << "Quack" << endl;
		}
};

class MuteQuack : public QuackBehavior
{
	public:
		void quack()
		{
			cout << "<<Silence>>" << endl;
		}
};

class Squack : public QuackBehavior
{
	public:
		void quack()
		{
			cout << "Squack" << endl;
		}
};

class FlyWithWings : public FlyBehavior
{
	public:
		void fly()
		{
			cout << "I'm flying!" << endl;
		}
};

class FlyNoWay : public FlyBehavior
{
	public:
		void fly()
		{
			cout << "I can't fly!" << endl;
		}
};

class FlyRocketPowerwd : public FlyBehavior
{
	public:
		void fly()
		{
			cout << "I'm flying with a rocket!" << endl;
		}
};

// the Duck superclass
class Duck
{
	public:
		QuackBehavior *quackBehavior;
		FlyBehavior   *flyBehavior;

		virtual void display() = 0;

		void performFly()
		{
			flyBehavior->fly();
		}

		void performQuack()
				{
					quackBehavior->quack();
				}

		void setQuackBehavior(QuackBehavior *qb)
		{
			cout << "Changing quack behavior..." << endl;
			quackBehavior = qb;
		}

		void setFlyBehavior(FlyBehavior *fb)
		{
			cout << "Changing fly behavior..." << endl;
			flyBehavior = fb;
		}

		void swim()
		{
			cout << "All ducks float, even decoys!" << endl;
		}

};


class MallardDuck : public Duck
{
	public:
		MallardDuck()
		{
			quackBehavior = new Quack();
			flyBehavior   = new FlyWithWings();
		}

		void display()
		{
			cout << "I'm a real Mallard duck!" << endl;
		}
};

class ModelDuck : public Duck
{
	public:
		ModelDuck()
		{
			flyBehavior   = new FlyNoWay();
			quackBehavior = new Quack();
		}

		void display()
		{
			cout << "I'm a model duck" << endl;
		}
};

// main function is here
int main()
{
	Duck *mallard = new MallardDuck();
	mallard->performQuack();
	mallard->performFly();

	Duck *model = new ModelDuck();
	model->performFly();
	model->setFlyBehavior(new FlyRocketPowerwd);
	model->performFly();

	return 0;
}

