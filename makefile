CXX := nvcc -ccbin nvc++
CXXFLAGS := -O3 -std=c++11 -expt-extended-lambda

DC := docker-compose run maker

.PHONY: all clean docker_make run
SRC := main.cu
TARGET := a.out

all: docker_make
docker_make:
	$(DC) make $(TARGET)

run:
	$(DC) ./$(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(SRC) -o $(TARGET) $(CXXFLAGS)

clean:
	rm $(TARGET)

