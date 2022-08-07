
class Bird(object):
	have_feather = True
	way_of_reproduction = 'egg'
	def move(self, dx, dy):
		position=[0,0]
		position[0]=position[0]+dx
		position[1]=position[1]+dy
		return position


summer = Bird()

summer.move(5,2)

summer.move(5,20)
